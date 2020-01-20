<?php
/**
 * Class Active Record
 * @author  <your-name-here>
 */
class Classe extends TRecord
{
    const TABLENAME = 'class';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('name');
    }


}
