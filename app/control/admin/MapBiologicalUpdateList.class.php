<?php
/**
 * MapBiologicalUpdateList Listing
 * @author  <your name here>
 */
class MapBiologicalUpdateList extends TStandardList
{
    protected $form;     // registration form
    protected $datagrid; // listing
    protected $pageNavigation;
    protected $formgrid;
    protected $saveButton;
    
    use Adianti\base\AdiantiStandardListTrait;
    
    /**
     * Page constructor
     */
    public function __construct()
    {
        parent::__construct();
        
        $this->setDatabase('permission');            // defines the database
        $this->setActiveRecord('MapBiological');   // defines the active record
        $this->setDefaultOrder('id', 'asc');         // defines the default order
        // $this->setCriteria($criteria) // define a standard filter

        $this->addFilterField('status', '=', 'status'); // filterField, operator, formField
        $this->addFilterField('id', '=', 'id'); // filterField, operator, formField
        $this->addFilterField('route', '=', 'route'); // filterField, operator, formField
        $this->addFilterField('date_time', 'like', 'date_time'); // filterField, operator, formField
        $this->addFilterField('utm', 'like', 'utm'); // filterField, operator, formField
        $this->addFilterField('species_cientifc', '=', 'species_cientifc'); // filterField, operator, formField
        $this->addFilterField('species_common', '=', 'species_common'); // filterField, operator, formField
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_MapBiological');
        $this->form->setFormTitle('Administração de Amostras Biológicas [ Finalização de Estudos / Mudança de Status ]');
        

        // create the form fields
        $status = new TCombo('status');
        $status->addItems(array('E'=> 'Em Estudo', 'F'=> 'Finalizado'));
        $id = new TEntry('id');
        $route = new TDBUniqueSearch('route', 'permission', 'Routes', 'id', 'route');
        $date_time = new TEntry('date_time');
        $utm = new TEntry('utm');
        $species_cientifc = new TDBUniqueSearch('species_cientifc', 'permission', 'SpeciesCientifc', 'id', 'name');
        $species_common = new TDBUniqueSearch('species_common', 'permission', 'SpeciesCommon', 'id', 'name');


        // add the fields
        $this->form->addFields( [ new TLabel('Status') ], [ $status ] );
        $this->form->addFields( [ new TLabel('ID') ], [ $id ] );
        $this->form->addFields( [ new TLabel('Rota') ], [ $route ] );
        //$this->form->addFields( [ new TLabel('Data/Hora') ], [ $date_time ] );
        $this->form->addFields( [ new TLabel('UTM') ], [ $utm ] );
        $this->form->addFields( [ new TLabel('Nome Científico') ], [ $species_cientifc ] );
        $this->form->addFields( [ new TLabel('Nome Comum') ], [ $species_common ] );


        // set sizes
        $status->setSize('20%');
        $id->setSize('10%');
        $route->setSize('70%');
        $date_time->setSize('40%');
        $utm->setSize('20%');
        $species_cientifc->setSize('70%');
        $species_common->setSize('70%');

        
        // keep the form filled during navigation with session data
        $this->form->setData( TSession::getValue('MapBiological_filter_data') );
        
        $btn = $this->form->addAction(_t('Find'), new TAction([$this, 'onSearch']), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        
        // creates a DataGrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->style = 'width: 100%';
        $this->datagrid->datatable = 'true';
        // $this->datagrid->enablePopover('Popover', 'Hi <b> {name} </b>');
        

        // creates the datagrid columns
        $column_status = new TDataGridColumn('status_widget', 'Status', 'left');
        $column_id = new TDataGridColumn('id', 'Id', 'right');
        $column_route = new TDataGridColumn('route', 'Rota', 'left');
        $column_date_time = new TDataGridColumn('date_time', 'Dt/Hr', 'left');
        $column_utm = new TDataGridColumn('utm', 'UTM', 'left');
        $column_species_cientifc = new TDataGridColumn('species_cientifc', 'Nome Científico', 'left');
        $column_species_common = new TDataGridColumn('species_common', 'Nome Comum', 'left');
        $column_icon = new TDataGridColumn('icon', '', 'left');


        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_status);
        //$this->datagrid->addColumn($column_id);
        $this->datagrid->addColumn($column_route);
        //$this->datagrid->addColumn($column_date_time);
        $this->datagrid->addColumn($column_utm);
        $this->datagrid->addColumn($column_species_cientifc);
        $this->datagrid->addColumn($column_species_common);
        $this->datagrid->addColumn($column_icon);
        
        $column_icon->setTransformer( function($image) {
            $image = new TImage("tmp/".$image);
            $image->style = 'max-width: 40px';
            return $image;
        });
        
        $action_edit = new TDataGridAction(array('DossieView', 'onView'));
        $action_edit->setButtonClass('btn btn-default');
        $action_edit->setLabel(('Ver Dossiê'));
        $action_edit->setImage('fa:table blue fa-lg');
        $action_edit->setField('id');
        $this->datagrid->addAction($action_edit);
        
        // create DELETE action
        $action_del = new TDataGridAction(array($this, 'onDelete'));
        $action_del->setButtonClass('btn btn-default');
        $action_del->setLabel(_t('Delete'));
        $action_del->setImage('fa:trash-o red fa-lg');
        $action_del->setField('id');
        $this->datagrid->addAction($action_del);
        
        // create the datagrid model
        $this->datagrid->createModel();
        
        // create the page navigation
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->setAction(new TAction([$this, 'onReload']));
        $this->pageNavigation->setWidth($this->datagrid->getWidth());
        
        $this->datagrid->disableDefaultClick();
        
        // put datagrid inside a form
        $this->formgrid = new TForm;
        $this->formgrid->add($this->datagrid);
        
        // creates the delete collection button
        $this->saveButton = new TButton('update_collection');
        $this->saveButton->setAction(new TAction(array($this, 'onSaveCollection')), AdiantiCoreTranslator::translate('Save'));
        $this->saveButton->setImage('fa:save green');
        $this->formgrid->addField($this->saveButton);
        
        $gridpack = new TPanelGroup;
        $gridpack->style = 'width: 100%';
        $gridpack->add($this->formgrid);
        $gridpack->addFooter($this->saveButton);//->style = 'background:whiteSmoke;border:1px solid #cccccc; padding: 3px;padding: 5px;';
        
        $this->setTransformer(array($this, 'onBeforeLoad'));
        


        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 90%';
        $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        $container->add(TPanelGroup::pack('', $gridpack, $this->pageNavigation));
        
        parent::add($container);
    }
    
    /**
     * Transform datagrid objects
     * Create one widget per element
     */
    public function onBeforeLoad($objects, $param)
    {
        // update the action parameters to pass the current page to action
        // without this, the action will only work for the first page
        $saveAction = $this->saveButton->getAction();
        $saveAction->setParameters($param); // important!
        
        $gridfields = array( $this->saveButton );
        
        foreach ($objects as $object)
        {
            $object->status_widget = new TCombo('status' . '_' . $object->id);
            $object->status_widget->addItems(array('E'=> 'Em Estudo', 'F'=> 'Finalizado'));
            $object->status_widget->setValue( $object->status );
            $object->status_widget->setSize('100px');
            $gridfields[] = $object->status_widget; // important
        }
        
        $this->formgrid->setFields($gridfields);
    }
    

    /**
     * Save the datagrid objects
     */
    public function onSaveCollection($param)
    {
        $data = $this->formgrid->getData(); // get datagrid form data
        $this->formgrid->setData($data); // keep the form filled
        
        try
        {
            // open transaction
            TTransaction::open('permission');
            
            // iterate datagrid form objects
            foreach ($this->formgrid->getFields() as $name => $field)
            {
                if ($field instanceof TCombo)
                {
                    $parts = explode('_', $name);
                    $id = end($parts);
                    $object = BiologicalSample::find($id);
                    
                    if ($object AND isset($param[$name]))
                    {
                        $object->status = $data->{$name};
                        $object->store();
                    }
                }
            }
            new TMessage('info', AdiantiCoreTranslator::translate('Records updated'));
            
            // close transaction
            TTransaction::close();
        }
        catch (Exception $e)
        {
            // show the exception message
            new TMessage('error', $e->getMessage());
        }
    }

}
