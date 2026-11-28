<?php

namespace App\Controller;

use App\Repository\AvisRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    //  attribut php, posé au dessus d'une fonction -> symfo la lit pour configurer des choses
    #[Route('/', name: 'app_home')]
    public function index(AvisRepository $avisRepository): Response
    {
        return $this->render('home/index.html.twig', [
            'derniersAvis' => $avisRepository->findDerniersValides()
        ]);
    }
}
