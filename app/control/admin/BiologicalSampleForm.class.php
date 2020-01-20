<?php
/**
 * BiologicalSampleForm Form
 * @author  <your name here>
 */
class BiologicalSampleForm extends TPage
{
    protected $form; // form
    
    /**
     * Form constructor
     * @param $param Request
     */
    public function __construct( $param )
    {
        parent::__construct();
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_BiologicalSample');
        $this->form->setFormTitle('Amostra Biológica [Lançamento]');
        

        // create the form fields
        $status = new TEntry('status');
        $status->setValue('E');
        $id = new TEntry('id');
        $route_id = new TDBUniqueSearch('route_id', 'permission', 'Routes', 'id', 'route');
        $route_id->setMinLength(1);
        $date_time = new TDateTime('date_time');
        $date_time->setMask('dd/mm/yyyy hh:ii');
        $date_time->setDatabaseMask('yyyy-mm-dd hh:ii');
        $distance = new TEntry('distance');
        $latit = new TEntry('latit');
        $longi = new TEntry('longi');
        $utm = new TEntry('utm');
        $species_cientific_id = new TDBUniqueSearch('species_cientific_id', 'permission', 'SpeciesCientifc', 'id', 'name');
        $species_cientific_id->setMinLength(1);
        $species_common_id = new TDBUniqueSearch('species_common_id', 'permission', 'SpeciesCommon', 'id', 'name');
        $species_common_id->setMinLength(1);
        $king_id = new TDBUniqueSearch('king_id', 'permission', 'King', 'id', 'name');
        $king_id->setMinLength(1);
        $class_id = new TDBUniqueSearch('class_id', 'permission', 'Classe', 'id', 'name');
        $class_id->setMinLength(1);
        $phylum_id = new TDBUniqueSearch('phylum_id', 'permission', 'Phylum', 'id', 'phylum');
        $phylum_id->setMinLength(1);
        $age = new TEntry('age');
        $habitat = new TEntry('habitat');
        $pickup_location = new TEntry('pickup_location');
        $larvas = new TRadioGroup('larvas');
        $larvas->addItems(array('N'=> 'Não', 'S'=> 'Sim')); 
        $larvas->setLayout('horizontal');       
        $carrapatos = new TRadioGroup('carrapatos');
        $carrapatos->addItems(array('N'=> 'Não', 'S'=> 'Sim')); 
        $carrapatos->setLayout('horizontal'); 
        $location = new TEntry('location');
        $ufms = new TRadioGroup('ufms');
        $ufms->addItems(array('N'=> 'Não', 'S'=> 'Sim')); 
        $ufms->setLayout('horizontal'); 
        $collection_user_id = new TDBUniqueSearch('collection_user_id', 'permission', 'SystemUser', 'id', 'name');
        $collection_user_id->setMinLength(1);
        $direction_road = new TRadioGroup('direction_road');
        $direction_road->addItems(array('E'=> 'Esquerda', 'D'=> 'Direira', 'ND'=>'Não Definida')); 
        $direction_road->setLayout('horizontal'); 
        $gender = new TRadioGroup('gender');
        $gender->addItems(array('M'=> 'Masculino', 'F'=> 'Feminino', 'ND'=>'Não Definido')); 
        $gender->setLayout('horizontal'); 
           
               

        // add the fields
        $this->form->addFields( [ new TLabel('(E) Em Estudo <br>(F) Finalizado ') ], [ $status ] );
        $this->form->addFields( [ new TLabel('Cód Amostra') ], [ $id ] );
        $this->form->addFields( [ new TLabel('Rota') ], [ $route_id ] );
        $this->form->addFields( [ new TLabel('Data/Hora') ], [ $date_time ] );
        $this->form->addFields( [ new TLabel('Distância (km)') ], [ $distance ] );
        $this->form->addFields( [ new TLabel('Latitude') ], [ $latit ] );
        $this->form->addFields( [ new TLabel('Longitude') ], [ $longi ] );
        $this->form->addFields( [ new TLabel('UTM') ], [ $utm ] );
        $this->form->addFields( [ new TLabel('Nome Espécie Científica') ], [ $species_cientific_id ] );
        $this->form->addFields( [ new TLabel('Nome Espécie Comum') ], [ $species_common_id ] );
        $this->form->addFields( [ new TLabel('Reino') ], [ $king_id ] );
        $this->form->addFields( [ new TLabel('Classe') ], [ $class_id ] );
        $this->form->addFields( [ new TLabel('Phylum') ], [ $phylum_id ] );
        $this->form->addFields( [ new TLabel('Idade') ], [ $age ] );
        $this->form->addFields( [ new TLabel('Habitat Bordas X/X') ], [ $habitat ] );
        $this->form->addFields( [ new TLabel('Local de Coleta') ], [ $pickup_location ] );
        $this->form->addFields( [ new TLabel('Larvas ?') ], [ $larvas ] );
        $this->form->addFields( [ new TLabel('Carrapatos ?') ], [ $carrapatos ] );
        $this->form->addFields( [ new TLabel('Local Encontrado') ], [ $location ] );
        $this->form->addFields( [ new TLabel('Foi Levado p/ UFMS ?') ], [ $ufms ] );
        $this->form->addFields( [ new TLabel('Usuário que coletou') ], [ $collection_user_id ] );
        $this->form->addFields( [ new TLabel('Sentido da Rodovia') ], [ $direction_road ] );
        $this->form->addFields( [ new TLabel('Sexo') ], [ $gender ] );

        $route_id->addValidation('Rota', new TRequiredValidator);
        $date_time->addValidation('Data/Hora', new TRequiredValidator);
        $distance->addValidation('Distância (km)', new TRequiredValidator);
        $latit->addValidation('Latitude', new TRequiredValidator);
        $longi->addValidation('Longitude', new TRequiredValidator);
        $utm->addValidation('UTM', new TRequiredValidator);
        $species_cientific_id->addValidation('Nome Espécie Científica', new TRequiredValidator);
        $species_common_id->addValidation('Nome Espécie Comum', new TRequiredValidator);
        $king_id->addValidation('Reino', new TRequiredValidator);
        $class_id->addValidation('Classe', new TRequiredValidator);
        $phylum_id->addValidation('Phylum', new TRequiredValidator);
        $collection_user_id->addValidation('Usuário que coletou', new TRequiredValidator);
        $direction_road->addValidation('Sentido da Rodovia', new TRequiredValidator);


        // set sizes
        $status->setSize('10%');
        $id->setSize('10%');
        $route_id->setSize('80%');
        $date_time->setSize('40%');
        $distance->setSize('50%');
        $latit->setSize('40%');
        $longi->setSize('40%');
        $utm->setSize('50%');
        $species_cientific_id->setSize('70%');
        $species_common_id->setSize('70%');
        $king_id->setSize('50%');
        $class_id->setSize('50%');
        $phylum_id->setSize('50%');
        $age->setSize('20%');
        $habitat->setSize('60%');
        $pickup_location->setSize('70%');
        $larvas->setSize('10%');
        $carrapatos->setSize('10%');
        $location->setSize('80%');
        $ufms->setSize('10%');
        $collection_user_id->setSize('70%');
        $direction_road->setSize('20%');
        $gender->setSize('20%');


        if (!empty($id))
        {
            $id->setEditable(FALSE);
            $status->setEditable(FALSE);
        }
        
        /** samples
         $fieldX->addValidation( 'Field X', new TRequiredValidator ); // add validation
         $fieldX->setSize( '100%' ); // set size
         **/
         
                 
        // create the form actions
        $btn = $this->form->addAction(_t('Save'), new TAction([$this, 'onSave']), 'fa:floppy-o');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addAction(_t('New'),  new TAction([$this, 'onEdit']), 'fa:eraser red');
        $btn = $this->form->addAction(('Voltar ao Mapa'), new TAction(['WelcomeView', 'onReload']), 'fa:map-o');
        $btn->class = 'btn btn-sm btn-success';
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 90%';
        $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        
        parent::add($container);
    }

    /**
     * Save form data
     * @param $param Request
     */
    public function onSave( $param )
    {
        try
        {
            TTransaction::open('permission'); // open a transaction
            
            /**
            // Enable Debug logger for SQL operations inside the transaction
            TTransaction::setLogger(new TLoggerSTD); // standard output
            TTransaction::setLogger(new TLoggerTXT('log.txt')); // file
            **/
            
            $this->form->validate(); // validate form data
            $data = $this->form->getData(); // get form data as array
            
            $object = new BiologicalSample;  // create an empty object
            $object->fromArray( (array) $data); // load the object with data
            $object->store(); // save the object
            
            // get the generated id
            $data->id = $object->id;
                        
            $criteria2 = new TCriteria; 
            $criteria2->add(new TFilter('system_group_id', '=', '2'));
            $users = SystemUserGroup::getObjects($criteria2);
            
            foreach ($users as $user)
            {
                SystemNotification::register( $user->system_user_id, 'Nova Amostra biológica foi inserida no sistema !!! Amostra Nº'.$data->id.'', 'Clique para acessar o Dossiê', 'class=DossieView&method=onView&key='.$data->id.'&id='.$data->id.'', 'Acessar', 'fa fa-table green' );
            }
                       
            
            $this->form->setData($data); // fill form data
            TTransaction::close(); // close the transaction
            
            new TMessage('info', TAdiantiCoreTranslator::translate('Record saved'));
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage()); // shows the exception error message
            $this->form->setData( $this->form->getData() ); // keep form data
            TTransaction::rollback(); // undo all pending operations
        }
    }
    
    /**
     * Clear form data
     * @param $param Request
     */
    public function onClear( $param )
    {
        $this->form->clear(TRUE);
    }
    
    /**
     * Load object to form data
     * @param $param Request
     */
    public function onEdit( $param )
    {
        try
        {
            if (isset($param['key']))
            {
                $key = $param['key'];  // get the parameter $key
                TTransaction::open('permission'); // open a transaction
                $object = new BiologicalSample($key); // instantiates the Active Record
                $this->form->setData($object); // fill the form
                TTransaction::close(); // close the transaction
            }
            else
            {
                $this->form->clear(TRUE);
            }
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage()); // shows the exception error message
            TTransaction::rollback(); // undo all pending operations
        }
    }
}
