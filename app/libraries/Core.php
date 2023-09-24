<?php

namespace App\libraries;


/**
 * ! Summary of Core
 * ! App core Class 
 * ! Create URL & loads core controller 
 * ! URL FORMAT - /controller/method/params
 */

class Core
{
    protected $currentController;
    protected $currentMethod;
    protected $url;
    protected $params = [];

    public function __construct()
    {
        $this->currentController = 'HomeController';
        $this->currentMethod = 'index';
        $this->loadController();
    }
    public function loadController()
    {
        $this->url =  $this->getUrl();
        // Look in controllers for first value
        if (!empty($this->url[0]) && !is_null($this->url[0])) {
            // If exists, set as controller
            $this->currentController = ucwords($this->url[0]);
            // Unset 0 Index
            unset($this->url[0]);
        }
        // Require the controller
        $controllerFile = '../app/controllers/' . $this->currentController . '.php';
        if (file_exists($controllerFile)) {
            require $controllerFile;
            $this->currentController = new $this->currentController;
        }

        // Work with URL
        if (isset($this->url[1])) {
            // Check if the controller method exists
            if (method_exists($this->currentController, $this->url[1])) {
                $this->currentMethod = $this->url[1];
                unset($this->url[1]);
            } else {
                // Return early if the controller method does not exist
                return;
            }
        }
        // Get the parameters after HomeController/about/get_all_parameters
        $this->params = $this->url ? array_values($this->url) : [];
        // Call the controller method, if it exists
        if (method_exists($this->currentController, $this->currentMethod)) {
            call_user_func_array([$this->currentController, $this->currentMethod], $this->params);
        }
    }


    public function getUrl()
    {
        if (isset($_GET['url'])) {
            $this->url = rtrim($_GET['url'], '/');
            $this->url = filter_var($this->url, FILTER_SANITIZE_URL);
            $this->url = explode('/', $this->url);
            return $this->url;
        }
    }
}
