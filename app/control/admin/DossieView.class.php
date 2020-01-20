<?php
/**
 * ViewIssueForm Registration
 * @author  <your name here>
 */
class DossieView extends TPage
{
    private $notes_area;
    private $subnotebook;
    private $form; // form
    private $attach_area;
    
    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_Issue');
        $this->form->setFormTitle(('Dossiê  -Amostra Biológica') );
        
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
        
        $status->setEditable(FALSE);
        $route_id->setEditable(FALSE);
        $date_time->setEditable(FALSE);
        $distance->setEditable(FALSE);
        $latit->setEditable(FALSE);
        $longi->setEditable(FALSE);
        $utm->setEditable(FALSE);
        $species_cientific_id->setEditable(FALSE);
        $species_common_id->setEditable(FALSE);
        $king_id->setEditable(FALSE);
        $class_id->setEditable(FALSE);
        $phylum_id->setEditable(FALSE);
        $age->setEditable(FALSE);
        $habitat->setEditable(FALSE);
        $pickup_location->setEditable(FALSE);
        $larvas->setEditable(FALSE);
        $carrapatos->setEditable(FALSE);
        $location->setEditable(FALSE);
        $ufms->setEditable(FALSE);
        $collection_user_id->setEditable(FALSE);
        $direction_road->setEditable(FALSE);
        $gender->setEditable(FALSE);
        $id->setEditable(FALSE);
        
        // define the sizes
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
        
        // creates a Datagrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->datatable = 'true';
        $this->datagrid->style = 'width: 100%';
        $this->datagrid->setHeight(320);
        

        // creates the datagrid columns
        $column_id = new TDataGridColumn('id', 'Id', 'center', 50);
        $column_title = new TDataGridColumn('title', _t('Title'), 'left');
        $column_category_id = new TDataGridColumn('category->name', _t('Category'), 'center');
        $column_submission_date = new TDataGridColumn('submission_date', _t('Date'), 'center', 100);

        $column_id->setTransformer(function($value, $object, $row) {
            if ($object->archive_date)
            {
                $row->style= 'text-shadow:none; color:#8c8484';
            }
            return $value;
        });
        $column_submission_date->setTransformer(function($value, $object, $row) {
            
            return TDate::date2br($value);
        });
        
        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_id);
        $this->datagrid->addColumn($column_title);
        $this->datagrid->addColumn($column_category_id);
        $this->datagrid->addColumn($column_submission_date);
        
        if (TSession::getValue('login') == 'admin')
        {
            $column_user = new TDataGridColumn('system_user->name', _t('User'), 'left');
            $this->datagrid->addColumn($column_user);
        }
        
       
        
        // create DOWNLOAD action
        $action_download = new TDataGridAction(array($this, 'onDownload'));
        //$action_edit->setUseButton(TRUE);
        $action_download->setButtonClass('btn btn-default');
        $action_download->setLabel(_t('Download'));
        $action_download->setImage('fa:cloud-download green fa-lg');
        $action_download->setField('id');
        $this->datagrid->addAction($action_download);

        
        
        // create the datagrid model
        $this->datagrid->createModel();
        
        // creates the page navigation
        //$this->pageNavigation = new TPageNavigation;
        //$this->pageNavigation->enableCounters();
        //$this->pageNavigation->setAction(new TAction(array($this, 'onReload')));
        //this->pageNavigation->setWidth($this->datagrid->getWidth());
        
        $panel = new TPanelGroup;
        $panel->add($this->datagrid);
        //$panel->addFooter($this->pageNavigation);

        $this->subnotebook = new BootstrapNotebookWrapper(new TNotebook);
        $this->form->addContent( [$this->subnotebook] );
        
        $this->form->addActionLink( ('Voltar ao Mapa'), new TAction(array('WelcomeView', 'onReload')), 'fa:map green' );
        
        $this->attach_area = new TVBox;
        $this->form->addContent( [$this->attach_area] );
        
        // creates the page structure using a vbox
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', 'WelcomeView'));
        $container->add($this->form);
        $this->subnotebook->appendPage(('Documentos'), $panel);
        //$container->add($panel);
        
        // add the vbox inside the page
        parent::add($container);
    }
    
    /**
     * method onView()
     * Executed whenever the user clicks at the edit button da datagrid
     */
    public function onDownload($param)
    {
        try
        {
            if (isset($param['id']))
            {
                $id = $param['id'];  // get the parameter $key
                TTransaction::open('communication'); // open a transaction
                $object = new SystemDocument($id); // instantiates the Active Record
                
                if ($object->system_user_id == TSession::getValue('userid') OR TSession::getValue('login') === 'admin')
                {
                    if (strtolower(substr($object->filename, -4)) == 'html')
                    {
                        $win = TWindow::create( $object->filename, 0.8, 0.8 );
                        $win->add( file_get_contents( "files/documents/{$id}/".$object->filename ) );
                        $win->show();
                    }
                    else
                    {
                        TPage::openFile("files/documents/{$id}/".$object->filename);
                    }
                }
                else
                {
                    new TMessage('error', _t('Permission denied'));
                }
                TTransaction::close(); // close the transaction
            }
            else
            {
                //$this->form->onReload();
            }
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage()); // shows the exception error message
            TTransaction::rollback(); // undo all pending operations
        }
    } 
     
    function onView($param)
    {
        try
        {
            if (isset($param['key']))
            {
                // get the parameter $key
                $key=$param['key'];
                
                // open a transaction with database 'changeman'
                TTransaction::open('permission');
                
                // instantiates object Issue
                $object = new BiologicalSample($key);
                $notes = $object-> notes;
                $notes_area_str = '';
                
                if (file_exists("attach/{$key}/$object->file"))
                {
                    $this->attach_area->add( TElement::tag('h4', _t('Attachment')) );
                    $this->attach_area->add( new THyperLink($object->file, "download.php?file=attach/{$key}/$object->file"));
                }
                
                if ($notes)
                {
                    foreach ($notes as $note)
                    {
                        TTransaction::open('permission');
                        $user = new SystemUser($note-> id_user);
                        TTransaction::close();
                        $notes_area_str .= '<u><b>'.$user-> name.'</b> '.
                                       '('.TDate::date2br($note-> register_date) . ' ' . $note-> register_time . ')</u>'.
                                       $note-> note . '<br>';
                    }
                }
                
                //$description     = new TTextDisplay($object->description);
                //$solution        = new TTextDisplay($object->solution);
                $notes_area      = new TTextDisplay($notes_area_str);
                //$description->style = 'margin:10px;display:block';
                //$solution->style = 'margin:10px;display:block';
                $notes_area->style = 'margin:10px;display:block';
                
                //$this->subnotebook->appendPage(_t('Description'), $description);
                //$this->subnotebook->appendPage(_t('Solution'), $solution);
                $this->subnotebook->appendPage(('Comentários'), $notes_area);
                
                // fill the form with the active record data
                $this->form->setData($object);
                
                //--------------------------------------------------------
                TTransaction::open('permission');
                $repository = new TRepository('SystemDocument');
            //$limit = 10;
            // creates a criteria
            $criteria = new TCriteria;
            
            if (empty($param['order']))
            {
                $param['order'] = 'id';
                $param['direction'] = 'asc';
            }
            $criteria->setProperties($param); // order, offset
            
            if (TSession::getValue('login') !== 'admin')
            {
                $criteria->add(new TFilter('system_user_id', '=', TSession::getValue('userid')));
            }
            
            $key2=$param['key'];
            
            
            
            $criteria->add(new TFilter('biological_sample_id', '=', ''.$key2.''));
                        
            // load the objects according to criteria
            $objects = $repository->load($criteria, FALSE);
            
            if (is_callable($this->transformCallback))
            {
                call_user_func($this->transformCallback, $objects, $param);
            }
            
            $this->datagrid->clear();
            if ($objects)
            {
                // iterate the collection of active records
                foreach ($objects as $object1)
                {
                    // add the object inside the datagrid
                    $this->datagrid->addItem($object1);
                }
            }
            
            // reset the criteria for record count
            $criteria->resetProperties();
            $count= $repository->count($criteria);
            $this->loaded = true;
            TTransaction::close();
                
                // close the transaction
                TTransaction::close();
            }
            else
            {
                $this->form->clear();
            }
        }
        catch (Exception $e) // in case of exception
        {
            // shows the exception error message
            new TMessage('error', $e->getMessage());
        }
    }
}
