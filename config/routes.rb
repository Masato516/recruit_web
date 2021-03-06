Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :photos
  devise_for :users
  root to: 'boards#index'
  resources :boards
  # メールの確認用
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#               rails_admin        /admin                                                                                   RailsAdmin::Engine
#                    photos GET    /photos(.:format)                                                                        photos#index
#                           POST   /photos(.:format)                                                                        photos#create
#                 new_photo GET    /photos/new(.:format)                                                                    photos#new
#                edit_photo GET    /photos/:id/edit(.:format)                                                               photos#edit
#                     photo GET    /photos/:id(.:format)                                                                    photos#show
#                           PATCH  /photos/:id(.:format)                                                                    photos#update
#                           PUT    /photos/:id(.:format)                                                                    photos#update
#                           DELETE /photos/:id(.:format)                                                                    photos#destroy
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#     new_user_confirmation GET    /users/confirmation/new(.:format)                                                        devise/confirmations#new
#         user_confirmation GET    /users/confirmation(.:format)                                                            devise/confirmations#show
#                           POST   /users/confirmation(.:format)                                                            devise/confirmations#create
#                      root GET    /                                                                                        boards#index
#                    boards GET    /boards(.:format)                                                                        boards#index
#                           POST   /boards(.:format)                                                                        boards#create
#                 new_board GET    /boards/new(.:format)                                                                    boards#new
#                edit_board GET    /boards/:id/edit(.:format)                                                               boards#edit
#                     board GET    /boards/:id(.:format)                                                                    boards#show
#                           PATCH  /boards/:id(.:format)                                                                    boards#update
#                           PUT    /boards/:id(.:format)                                                                    boards#update
#                           DELETE /boards/:id(.:format)                                                                    boards#destroy
#         letter_opener_web        /letter_opener                                                                           LetterOpenerWeb::Engine
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment
