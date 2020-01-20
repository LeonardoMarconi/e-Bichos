<?php
/**
 * Note Active Record
 * @author  <your-name-here>
 */
class Note extends TRecord
{
    const TABLENAME = 'note';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'max'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('id_biological_sample');
        parent::addAttribute('id_user');
        parent::addAttribute('note');
        parent::addAttribute('register_date');
        parent::addAttribute('register_time');
    }


}
