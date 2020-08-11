Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # -------------
  # Create an index action to list all tasks (/tasks will open it)
  get 'tasks', to: 'tasks#index'

  # -------------
  # Create / Add a new task - we need to routes to handle it
  # Route to display the task form GET
  get 'tasks/new', to: 'tasks#new'
  # Route to handle the POST request after submiting the form
  post 'tasks', to: 'tasks#create'

  # -------------
  # Update - two step process
  # GET the html form to edit - when dealing with dynamic content, it should be on top of the page
  #                                       this defines the prefix
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit
  # PATCH the parameters to update an existing task
  patch 'tasks/:id', to: 'tasks#update'

  # -------------
  # Remove / Destroy tasks directly from the list
  delete 'tasks/:id', to: 'tasks#destroy'

  # -------------
  # We want to read / find one specific task - use the id to open a new page with the details of the task
  # POSITIONED HERE DUE TO DYNAMIC CONTENT
  get 'tasks/:id', to: 'tasks#show', as: :task
end
