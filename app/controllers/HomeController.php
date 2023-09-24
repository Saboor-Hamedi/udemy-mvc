<?php

use App\libraries\Controller;

/**
 * Summary of HomeController
 */
class HomeController extends Controller
{
    /**
     * Summary of __construct
     */
    public function __construct()
    {
    }

    public function index()
    {
        return $this->view('home', ['title' => 'Saboor']);
    }
}
