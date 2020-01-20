<?php
/**
 * WelcomeView
 *
 * @version    1.0
 * @package    control
 * @author     Leonardo Marconi
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class WelcomeView extends TPage
{
    /**
     * Class constructor
     * Creates the page
     */
    private $html3;
    private $pageNavigation;
    
    function __construct()
    {
        parent::__construct();
        
        $this->form = new BootstrapFormBuilder('form_MapBiological');
        $this->form->setFormTitle('Mapa de Ocorrências - Amostras Biológicas');
        

        // create the form fields
        $id = new TEntry('id');
        $route = new TDBUniqueSearch('route', 'permission', 'Routes', 'route', 'route');
        $route->setMinLength(1);
        $date_time = new TDateTime('date_time');
        $date_time->setMask('dd/mm/yyyy hh:ii');
        $date_time->setDatabaseMask('yyyy-mm-dd hh:ii');
        $status = new TCombo('status');
        $options = ['E'=>'Em Estudo', 'F' => 'Finalizado'];
        $status->addItems($options);
        $species_common = new TDBUniqueSearch('species_common', 'permission', 'SpeciesCommon', 'name', 'name');
        $species_common->setMinLength(1);
        $usuario = new TDBUniqueSearch('usuario', 'permission', 'SystemUser', 'name', 'name');
        $usuario->setMinLength(1);
        
        $this->form->addFields( [ new TLabel('Nº da Amostra') ], [ $id ] );
        $this->form->addFields( [ new TLabel('Rota') ], [ $route ] );
        $this->form->addFields( [ new TLabel('Data/Hora Coleta') ], [ $date_time ] );
        $this->form->addFields( [ new TLabel('Status') ], [ $status ] );
        $this->form->addFields( [ new TLabel('Nome Comum da Espécie') ], [ $species_common ] );
        $this->form->addFields( [ new TLabel('Coletado por') ], [ $usuario ] );
        
        $id->setSize('10%');
        $route->setSize('80%');
        $date_time->setSize('40%');
        $status->setSize('50%');
        $species_common->setSize('80%');
        $usuario->setSize('70%');
        
        $this->form->setData( TSession::getValue('MapBiological_filter_data') );
        
        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction([$this, 'onSearch']), 'fa:search');
        $btn->class = 'btn btn-sm btn-warning';
        $btn2=$this->form->addAction(('Lançar Amostras Biológicas'), new TAction(['BiologicalSampleForm', 'onEdit']), 'fa:copy');
        $btn2->class = 'btn btn-sm btn-primary';
        $btn3=$this->form->addAction(('Lançar Documentos/Laudos/Exames'), new TAction(['SystemDocumentUploadForm', 'onNew']), 'fa:upload');
        $btn3->class = 'btn btn-sm btn-primary';
        
        
        
        $this->html3 = new THtmlRenderer('app/resources/system_welcome_es.html');

        // replace the main section variables
        
        $this->html3->enableSection('main', array());
        
        
        $vbox = new TVBox;
        //$vbox = TVBox::pack($panel3);
        $vbox->style = 'display:block; width: 100%';
        $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $vbox->add($this->form);
        $vbox->add(TPanelGroup::pack('', $this->html3));
        
        
        // add the template to the page
        parent::add( $vbox );
    }
    
    public function onSearch()
    {
        // get the search form data
        $data = $this->form->getData();
        
        // clear session filters
        TSession::setValue('WelcomeView_filter_id',   NULL);
        TSession::setValue('WelcomeView_filter_route',   NULL);
        TSession::setValue('WelcomeView_filter_date_time',   NULL);
        TSession::setValue('WelcomeView_filter_status',   NULL);
        TSession::setValue('WelcomeView_filter_species_common',   NULL);
        TSession::setValue('WelcomeView_filter_usuario',   NULL);


        if (isset($data->id) AND ($data->id)) {
            $filter = new TFilter('id', '=', "%{$data->id}%"); // create the filter
            TSession::setValue('WelcomeView_filter_id',   $filter); // stores the filter in the session
        }
        if (isset($data->route) AND ($data->route)) {
            $filter = new TFilter('route', 'like', "%{$data->route}%"); // create the filter
            TSession::setValue('WelcomeView_filter_route',   $filter); // stores the filter in the session
        }
        if (isset($data->date_time) AND ($data->date_time)) {
            $filter = new TFilter('date_time', 'like', "%{$data->date_time}%"); // create the filter
            TSession::setValue('WelcomeView_filter_date_time',   $filter); // stores the filter in the session
        }
        if (isset($data->status) AND ($data->status)) {
            $filter = new TFilter('status', 'like', "%{$data->status}%"); // create the filter
            TSession::setValue('WelcomeView_filter_status',   $filter); // stores the filter in the session
        }
        if (isset($data->species_common) AND ($data->species_common)) {
            $filter = new TFilter('species_common', 'like', "%{$data->species_common}%"); // create the filter
            TSession::setValue('WelcomeView_filter_species_common',   $filter); // stores the filter in the session
        }
        if (isset($data->usuario) AND ($data->usuario)) {
            $filter = new TFilter('usuario', 'like', "%{$data->usuario}%"); // create the filter
            TSession::setValue('WelcomeView_filter_usuario',   $filter); // stores the filter in the session
        }

        
        // fill the form with data again
        $this->form->setData($data);
        
        // keep the search data in the session
        TSession::setValue('MapBiological_filter_data', $data);
        
        $param = array();
        $param['offset']    =0;
        $param['first_page']=1;
        $this->onReload($param);
    }
   
    public function onReload( $param )
    {
        try
        {
            
            // load the products
            TTransaction::open('permission');
            
            $criteria = new TCriteria;            

            if (TSession::getValue('WelcomeView_filter_id')) {
                $criteria->add(TSession::getValue('WelcomeView_filter_id')); // add the session filter
            }
            if (TSession::getValue('WelcomeView_filter_route')) {
                $criteria->add(TSession::getValue('WelcomeView_filter_route')); // add the session filter
            }
            if (TSession::getValue('WelcomeView_filter_date_time')) {
                $criteria->add(TSession::getValue('WelcomeView_filter_date_time')); // add the session filter
            }
            if (TSession::getValue('WelcomeView_filter_status')) {
                $criteria->add(TSession::getValue('WelcomeView_filter_status')); // add the session filter
            }
            if (TSession::getValue('WelcomeView_filter_species_common')) {
                $criteria->add(TSession::getValue('WelcomeView_filter_species_common')); // add the session filter
            }
            if (TSession::getValue('WelcomeView_filter_usuario')) {
                $criteria->add(TSession::getValue('WelcomeView_filter_usuario')); // add the session filter
            }
            
             
            $exames = MapBiological::getObjects($criteria);
            
            TTransaction::close();
        
            $replace_detail = array();
            if ($exames)
            {
     
                // iterate products
                foreach ($exames as $md2)
                {
                    if( $md2->status == 'E'){
                        $md2->status = 'EM ESTUDO';
                        $md2->ufms = '';
                    }else if($md2->status == 'F'){
                        $md2->status = 'FINALIZADO';
                        $md2->ufms = 'none';
                    }else{
                        $md2->status = '';
                    }
                       	            
                    $replace_detail[] = $md2->toArray();
                     // array of replacements
                }
            }
            
            
            
            
            // enable products section as repeatable
            $this->html3->enableSection('bio', $replace_detail, TRUE);
            
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    public function show()
    {
        $this->onReload( func_get_arg(0) );
        parent::show();
    }
    
   
}
