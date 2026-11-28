<?php

namespace App\Repository;

use App\Entity\Avis;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Avis>
 */
// Hérite de find(), findALl(), findBy(), findOneBy()
class AvisRepository extends ServiceEntityRepository
{
    // Le constructeur dit à la classe parente quelle entité ce repository gère : Avis
    // ManagerRegistry (l'accès de Doctrine à la base) est fourni automatiquement par Symfony
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Avis::class);
    }

    /**
     * Les derniers avis validés, du plus récent au plus ancien
     * La table avis n'a pas de date : " plus récent " = plus grand
     * @return Avis[]
     */
    public function findDerniersValides(int $nombre = 3): array
    {
        return $this->findBy(
            ['statut' => 'validé'],
            ['id' => 'DESC'],
            $nombre // 3 par défaut 
        );
    }
}
