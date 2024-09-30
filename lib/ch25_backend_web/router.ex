defmodule Ch25BackendWeb.Router do
  use Ch25BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug Ch25BackendWeb.Plugs.Authenticate
  end

  scope "/api", Ch25BackendWeb do
    pipe_through [:api, :authenticated]

    resources "/users", UserController, except: [:new, :edit]
    resources "/teams", TeamController, except: [:new, :edit]
    resources "/check_ins", CheckInController, except: [:new, :edit]
    resources "/questions", QuestionController, except: [:new, :edit]
    resources "/answers", AnswerController, except: [:new, :edit]
  end
end
