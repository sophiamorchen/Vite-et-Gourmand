<?php

namespace App\Entity;

// types : noms des types de colonne (TEXT, SMALLINT...)
use Doctrine\DBAL\Types\Types;
// ORM : les attributs de mapping (#[ORM\Entity], #[ORM\Column]...)
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Avis
{
    // --- Colonnes (une propriété = une colonne) ---

    // id : clé primaire, fabriquée par la base (AUTO_INCREMENT)
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    // description : TEXT NOT NULL (le commentaire du client)
    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    // note : TINYINT dans la base -> SMALLINT ici (voir cours)
    #[ORM\Column(type: Types::SMALLINT)]
    private ?int $note = null;

    // statut : VARCHAR(255) NOT NULL ('en attente', 'validé', 'refusé')
    #[ORM\Column(length: 255)]
    private ?string $statut = null;

    // (commande_id : prochain cours)

    // --- Getter et Setters ---

    // Pas de setId() : c'est la base qui donne l'id
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }
    public function setDescription(string $description): static
    {
        $this->description = $description;
        return $this;
    }

    public function getNote(): ?int
    {
        return $this->note;
    }
    public function setNote(int $note): static
    {
        $this->note = $note;
        return $this;
    }

    public function getStatut(): ?string
    {
        return $this->statut;
    }

    public function setStatut(string $statut): static
    {
        $this->statut = $statut;
        return $this;
    }
}
