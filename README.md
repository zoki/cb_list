# CbList

[![Gem Version](https://badge.fury.io/rb/cb_list.svg)](https://badge.fury.io/rb/cb_list)
[![Code Climate](https://codeclimate.com/github/zoki/cb_list/badges/gpa.svg)](https://codeclimate.com/github/zoki/cb_list)


List Active Record callbacks for a given class


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cb_list', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cb_list

## Usage
Display callbacks for Post model:

    $ bin/rails ar:callbacks:show[Post] 


### Example

    $ bin/rails ar:callbacks:show[Spree::Product]

    # Spree::Product Active Record Callbacks
    # 
    # 1. INITIALIZE
    # ====================
    # 
    # after_initialize
    # --------------------
    # 1. ensure_master
    # 2. build_first_node
    # 3. on_initialize
    # 
    # 2. FIND
    # ====================
    # 
    # after_find
    # --------------------
    # Empty
    # 
    # 3. TOUCH
    # ====================
    # 
    # after_touch
    # --------------------
    # 1. touch_taxons
    # 
    # 4. VALIDATION
    # ====================
    # 
    # before_validation
    # --------------------
    # 1. set_slug
    # 2. normalize_slug
    # 3. validate_master
    # 4. set_translation
    # 
    # after_validation
    # --------------------
    # 1. unset_slug_if_invalid
    # 2. _ensure_no_duplicate_errors
    # 3. reflect_errors_messages
    # 
    # 5. SAVE
    # ====================
    # 
    # before_save
    # --------------------
    # 1. autosave_associated_records_for_tax_category
    # 2. autosave_associated_records_for_shipping_category
    # 3. set_nodes_default_locale_and_fallback
    # 4. before_save_collection_association
    # 
    # after_save
    # --------------------
    # 1. create_slug
    # 2. run_touch_callbacks
    # 3. update_pg_search_documents
    # 
    # around_save
    # --------------------
    # Empty
    # 
    # 6. CREATE
    # ====================
    # 
    # before_create
    # --------------------
    # Empty
    # 
    # after_create
    # --------------------
    # 1. autosave_associated_records_for_slugs
    # 2. autosave_associated_records_for_product_option_types
    # 3. autosave_associated_records_for_option_types
    # 4. autosave_associated_records_for_product_properties
    # 5. autosave_associated_records_for_properties
    # 6. autosave_associated_records_for_variant_property_rules
    # 7. autosave_associated_records_for_variant_property_rule_values
    # 8. autosave_associated_records_for_variant_property_rule_conditions
    # 9. autosave_associated_records_for_classifications
    # 10. autosave_associated_records_for_taxons
    # 11. autosave_associated_records_for_product_promotion_rules
    # 12. autosave_associated_records_for_promotion_rules
    # 13. autosave_associated_records_for_master
    # 14. autosave_associated_records_for_variants
    # 15. autosave_associated_records_for_variants_including_master
    # 16. autosave_associated_records_for_prices
    # 17. autosave_associated_records_for_stock_items
    # 18. autosave_associated_records_for_line_items
    # 19. autosave_associated_records_for_orders
    # 20. autosave_associated_records_for_variant_images
    # 21. build_variants_from_option_values_hash
    # 22. autosave_associated_records_for_nodes
    # 23. autosave_associated_records_for_translations
    # 
    # around_create
    # --------------------
    # Empty
    # 
    # 7. UPDATE
    # ====================
    # 
    # before_update
    # --------------------
    # Empty
    # 
    # after_update
    # --------------------
    # 1. autosave_associated_records_for_slugs
    # 2. autosave_associated_records_for_product_option_types
    # 3. autosave_associated_records_for_option_types
    # 4. autosave_associated_records_for_product_properties
    # 5. autosave_associated_records_for_properties
    # 6. autosave_associated_records_for_variant_property_rules
    # 7. autosave_associated_records_for_variant_property_rule_values
    # 8. autosave_associated_records_for_variant_property_rule_conditions
    # 9. autosave_associated_records_for_classifications
    # 10. autosave_associated_records_for_taxons
    # 11. autosave_associated_records_for_product_promotion_rules
    # 12. autosave_associated_records_for_promotion_rules
    # 13. autosave_associated_records_for_master
    # 14. autosave_associated_records_for_variants
    # 15. autosave_associated_records_for_variants_including_master
    # 16. autosave_associated_records_for_prices
    # 17. autosave_associated_records_for_stock_items
    # 18. autosave_associated_records_for_line_items
    # 19. autosave_associated_records_for_orders
    # 20. autosave_associated_records_for_variant_images
    # 21. autosave_associated_records_for_nodes
    # 22. autosave_associated_records_for_translations
    # 
    # around_update
    # --------------------
    # Empty
    # 
    # 8. DESTROY
    # ====================
    # 
    # before_destroy
    # --------------------
    # 1. #<Proc:0x007feb7a908cc0@/Users/zzabcic/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.0.2/lib/active_record/associations/builder/association.rb:140 (lambda)>
    # 2. #<Proc:0x007feb7a8f1890@/Users/zzabcic/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.0.2/lib/active_record/associations/builder/association.rb:140 (lambda)>
    # 3. #<Proc:0x007feb7a8d9768@/Users/zzabcic/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.0.2/lib/active_record/associations/builder/association.rb:140 (lambda)>
    # 4. #<Proc:0x007feb7a8c5a10@/Users/zzabcic/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.0.2/lib/active_record/associations/builder/association.rb:140 (lambda)>
    # 5. #<Proc:0x007feb7a888ea8@/Users/zzabcic/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.0.2/lib/active_record/associations/builder/association.rb:140 (lambda)>
    # 6. #<Proc:0x007feb7a86caa0@/Users/zzabcic/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.0.2/lib/active_record/associations/builder/association.rb:140 (lambda)>
    # 7. #<Proc:0x007feb793cf9a8@/Users/zzabcic/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/activerecord-5.0.2/lib/active_record/associations/builder/association.rb:140 (lambda)>
    # 
    # after_destroy
    # --------------------
    # 1 punch_slug
    # 
    # around_destroy
    # --------------------
    # Empty
    # 
    # 9. COMMIT
    # ====================
    # 
    # after_commit
    # --------------------
    # Empty
    # 
    # 10. ROLLBACK
    # ====================
    # 
    # after_rollback
    # --------------------
    # Empty


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cb_list. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

