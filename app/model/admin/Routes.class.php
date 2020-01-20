<?php
/**
 * Routes Active Record
 * @author  <your-name-here>
 */
class Routes extends TRecord
{
    const TABLENAME = 'routes';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('route');
    }


}
