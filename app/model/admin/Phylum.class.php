<?php
/**
 * Phylum Active Record
 * @author  <your-name-here>
 */
class Phylum extends TRecord
{
    const TABLENAME = 'phylum';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('phylum');
    }


}
