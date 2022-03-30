class ApplicationController < ActionController::Base
  # ログインしていない状態でトップページ以外のアクセスされた時、ログイン画面へリダイレクトする設定
  before_action :authenticate_user!,except: [:top]
  # deviseのヘルパーメソッド名を指定、deviseに関する処理であるときだけ、configure_permitted_parametersメソッドを実行するようにする
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログインしたらBooksにリダイレクトさせる
  def after_sign_in_path_for(resource)
    books_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
