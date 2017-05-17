module CbList
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/cb_list.rake'
    end
  end
end