

# ------------------------------------------------------------------------------
# This is the server logic of the Shiny web application
# ------------------------------------------------------------------------------

# -- Define server logic
shinyServer(
  function(input, output, session){


    # -------------------------------------
    # Environment
    # -------------------------------------

    # -- Get path to demo app data
    data_dir <- "../data"

    # -- declare r communication object
    r <- reactiveValues()


    # -------------------------------------
    # Launch module servers
    # -------------------------------------

    # -- start module server: data
    kitems::kitemsManager_Server(id = "data", r = r, path = data_dir,
                                 create = FALSE, autosave = FALSE)


    # -------------------------------------
    # Observe item lists
    # -------------------------------------

    # -- data
    observeEvent(r$data_items(), {

      cat("Main application server observeEvent: data_items() has just been updated \n")

    })


    # -------------------------------------
    # Generate dynamic sidebar
    # -------------------------------------

    output$menu <- renderMenu(kitems::dynamic_sidebar(r))


  }
)
