namespace :ar do
  namespace :callbacks do
    desc "Display ActiveRecord Callbacks for a given Class (`rails ar:callbacks:show[Post]`)"
    task :show, [:klass] => :environment do |_, args|
      klass = args.klass or fail "A klass must be supplied, e.g. Post"

      CbList.show klass
    end
  end
end