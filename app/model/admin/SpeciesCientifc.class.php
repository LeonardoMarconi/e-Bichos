<?php
/**
 * SpeciesCientifc Active Record
 * @author  <your-name-here>
 */
class SpeciesCientifc extends TRecord
{
    const TABLENAME = 'species_cientifc';
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
