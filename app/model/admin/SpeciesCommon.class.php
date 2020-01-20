<?php
/**
 * SpeciesCommon Active Record
 * @author  <your-name-here>
 */
class SpeciesCommon extends TRecord
{
    const TABLENAME = 'species_common';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('name');
        parent::addAttribute('icon');
    }


}
