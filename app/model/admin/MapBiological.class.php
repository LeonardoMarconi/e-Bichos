<?php
/**
 * MapBiological Active Record
 * @author  <your-name-here>
 */
class MapBiological extends TRecord
{
    const TABLENAME = 'map_biological';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('route');
        parent::addAttribute('date_time');
        parent::addAttribute('distance');
        parent::addAttribute('latit');
        parent::addAttribute('longi');
        parent::addAttribute('utm');
        parent::addAttribute('species_cientifc');
        parent::addAttribute('species_common');
        parent::addAttribute('icon');
        parent::addAttribute('age');
        parent::addAttribute('habitat');
        parent::addAttribute('pickup_location');
        parent::addAttribute('larvas');
        parent::addAttribute('carrapatos');
        parent::addAttribute('location');
        parent::addAttribute('ufms');
        parent::addAttribute('usuario');
        parent::addAttribute('direction_road');
        parent::addAttribute('gender');
        parent::addAttribute('reino');
        parent::addAttribute('phylum');
        parent::addAttribute('classe');
        parent::addAttribute('status');
    }


}
