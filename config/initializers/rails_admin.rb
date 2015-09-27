RailsAdmin.config do |config|

  config.current_user_method(&:current_user)
  config.authorize_with :cancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Category' do
    list do
      field :name
      field :user
      field :slug
    end

    edit do
      field :name
      field :description
      field :user
      field :slug
    end
  end

  config.model 'GearList' do
    list do
      field :name
      field :user
      field :category
      field :slug
      field :blessed
    end

    edit do
      field :name
      field :user
      field :category
      field :slug
      field :blessed
    end
  end

  config.model 'GearListItem' do
    list do
      field :gear_list
      field :item
      field :quantity
    end
  end

  config.model 'Item' do
    list do
      field :name
      field :user
      field :default_amount
      field :locked
    end

    edit do
      field :name
      field :description
      field :user
      field :default_amount
      field :locked
    end
  end

  config.model 'User' do
    list do
      field :name
      field :email
      field :admin_level
      field :slug
    end

    edit do
      field :name
      field :email
      field :admin_level
      field :slug
      field :password
      field :password_confirmation
    end
  end
end
