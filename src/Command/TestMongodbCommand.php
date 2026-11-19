<?php
// dossier src/Command -> namespace App\Command
namespace App\Command;

// les classes utilisées dans ce dossier
use MongoDB\Database; // la base mongoDB
use Symfony\Component\Console\Attribute\AsCommand; // pour déclarer la commande
use Symfony\Component\Console\Command\Command; // pour les codes de fin (SUCCESS)
use Symfony\Component\Console\Input\InputInterface; // ce qui est tapé dans le terminal
use Symfony\Component\Console\Output\OutputInterface; // ce qui est affiché dans le terminal
use Symfony\Component\Console\Style\SymfonyStyle; //a ffichage en couleur (titres, [OK]...)

// nom à taper après "php bin/console" et description affichée dans la liste des commandes
#[AsCommand(
    name: 'app:test-mongodb',
    description: 'Écrit, puis relit un doc de test dans MongoDB.'
)]
class TestMongodbCommand
{
    // le constructeur demande un MongoDB\Databse :
    // Symfony fabrique ce service (services.yaml : client + selecteDatabase) et le donne ici
    public function __construct(
        private Database $database,
    ) {}
    // __invoke = ce qui s'exécute quand on lance la commande
    public function __invoke(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $io->title('Test de la connexion MongoDB');

        // choisir la collection test_connexion (créée automatiquement au premier document)
        $collection = $this->database->selectCollection('test_connexion');

        // ÉCRIRE : un document = un tableau clé => valeur
        $resultat = $collection->insertOne([
            'message' => 'Hey you its me Mario soso MongoDB',
            'machine' => gethostname(), // nom de la machine qui écrit (PC ou serveur)
            'date' => date('Y-m-d H:i:s'), // date et heure de l'écriture
        ]);

        // RELIRE  :chercher le document par son ID (_id), crée par MongoDB à l'écriture
        $document = $collection->findOne(['_id' => $resultat->getInsertedId()]);

        // Afficher ce qui a été relu
        $io->writeln('Base : ' . $this->database->getDatabaseName());
        $io->writeln('Message relu : ' . $document['message']);
        $io->writeln('Ecrit depuis : ' . $document['machine'] . ', le ' . $document['date']);
        $io->success('Document écrit puis relu dans MongoDb.');

        // code de fin 0 = tout s'est bien passé
        return Command::SUCCESS;
    }
}
