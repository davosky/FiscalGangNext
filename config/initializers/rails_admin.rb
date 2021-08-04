RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_operator.admin == true
  end

  config.parent_controller = 'ApplicationController'

  config.main_app_name = ['FiscalGangNext']

  config.model 'Operator' do
    visible true
    label 'Operatore'
    label_plural 'Operatori'
  end

  config.model 'Category' do
    visible true
    label 'Categoria'
    label_plural 'Categorie'
  end

  config.model 'Practice' do
    visible true
    label 'Pratica'
    label_plural 'Pratiche'
  end

  config.model 'Request' do
    visible true
    label 'Richiesta Pratica'
    label_plural 'Richieste Pratica'
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
