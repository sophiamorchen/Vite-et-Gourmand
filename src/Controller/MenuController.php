<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class MenuController extends AbstractController
{
    // L'attribut #[Route] relie l'URL donnée ("/menus") à cette méthode
    // en gros : pour /menus appelle la methode index() du controleur MenuController
    #[Route('/menus', name: 'app_menus')]
    public function index(): Response
    {
        // render() lit le template, fabrique le HTML et le met dans un objet Response
        return $this->render('menu/index.html.twig');
    }
}
