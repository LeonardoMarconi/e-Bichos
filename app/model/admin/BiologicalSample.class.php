<?php
/**
 * BiologicalSample Active Record
 * @author  <your-name-here>
 */
class BiologicalSample extends TRecord
{
    use SystemChangeLogTrait;
    const TABLENAME = 'biological_sample';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    private $classe;
    private $king;
    private $phylum;
    private $routes;

    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('route_id');
        parent::addAttribute('date_time');
        parent::addAttribute('distance');
        parent::addAttribute('latit');
        parent::addAttribute('longi');
        parent::addAttribute('utm');
        parent::addAttribute('species_cientific_id');
        parent::addAttribute('species_common_id');
        parent::addAttribute('age');
        parent::addAttribute('habitat');
        parent::addAttribute('pickup_location');
        parent::addAttribute('larvas');
        parent::addAttribute('carrapatos');
        parent::addAttribute('location');
        parent::addAttribute('ufms');
        parent::addAttribute('collection_user_id');
        parent::addAttribute('direction_road');
        parent::addAttribute('gender');
        parent::addAttribute('king_id');
        parent::addAttribute('phylum_id');
        parent::addAttribute('class_id');
        parent::addAttribute('status');
    }

    
    /**
     * Method set_classe
     * Sample of usage: $biological_sample->classe = $object;
     * @param $object Instance of Classe
     */
    public function set_classe(Classe $object)
    {
        $this->classe = $object;
        $this->classe_id = $object->id;
    }
    
    /**
     * Method get_classe
     * Sample of usage: $biological_sample->classe->attribute;
     * @returns Classe instance
     */
    public function get_classe()
    {
        // loads the associated object
        if (empty($this->classe))
            $this->classe = new Classe($this->classe_id);
    
        // returns the associated object
        return $this->classe;
    }
    
    
    /**
     * Method set_king
     * Sample of usage: $biological_sample->king = $object;
     * @param $object Instance of King
     */
    public function set_king(King $object)
    {
        $this->king = $object;
        $this->king_id = $object->id;
    }
    
    /**
     * Method get_king
     * Sample of usage: $biological_sample->king->attribute;
     * @returns King instance
     */
    public function get_king()
    {
        // loads the associated object
        if (empty($this->king))
            $this->king = new King($this->king_id);
    
        // returns the associated object
        return $this->king;
    }
    
    
    /**
     * Method set_phylum
     * Sample of usage: $biological_sample->phylum = $object;
     * @param $object Instance of Phylum
     */
    public function set_phylum(Phylum $object)
    {
        $this->phylum = $object;
        $this->phylum_id = $object->id;
    }
    
    /**
     * Method get_phylum
     * Sample of usage: $biological_sample->phylum->attribute;
     * @returns Phylum instance
     */
    public function get_phylum()
    {
        // loads the associated object
        if (empty($this->phylum))
            $this->phylum = new Phylum($this->phylum_id);
    
        // returns the associated object
        return $this->phylum;
    }
    
    
    /**
     * Method set_routes
     * Sample of usage: $biological_sample->routes = $object;
     * @param $object Instance of Routes
     */
    public function set_routes(Routes $object)
    {
        $this->routes = $object;
        $this->routes_id = $object->id;
    }
    
    /**
     * Method get_routes
     * Sample of usage: $biological_sample->routes->attribute;
     * @returns Routes instance
     */
    public function get_routes()
    {
        // loads the associated object
        if (empty($this->routes))
            $this->routes = new Routes($this->routes_id);
    
        // returns the associated object
        return $this->routes;
    }
     public function get_notes()
    {
        $repos = new TRepository('Note');
        $criteria = new TCriteria;
        $criteria->add(new TFilter('id_biological_sample', '=', $this-> id));
        return $repos->load($criteria);
    }
    
    /**
     * Delete an Active Record object from the database
     * @param [$id]     The Object ID
     * @exception       Exception if there's no active transaction opened
     */
    public function delete($id = NULL)
    {
        $id = isset($id) ? $id : $this->{'id'};
        
        $note_rep = new TRepository('Note');
        
        $criteria = new TCriteria;
        $criteria->add(new TFilter('id_biological_sample', '=', $id));
        
        $note_rep->delete($criteria);
        
        // delete the object itself
        parent::delete($id);
    }
    


}
