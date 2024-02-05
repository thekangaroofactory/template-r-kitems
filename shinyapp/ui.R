

# ------------------------------------------------------------------------------
# This is the user-interface definition of the Shiny web application
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Define Sidebar UI
# ------------------------------------------------------------------------------

sidebar <- dashboardSidebar(

  # -- static section
  sidebarMenu(
    menuItem("Home", tabName = "home", icon = icon("dashboard"), selected = TRUE)),

  # -- add dynamic section
  sidebarMenu(id = "tabs", sidebarMenuOutput("menu")),

  collapsed = FALSE)


# ------------------------------------------------------------------------------
# Define Body UI
# ------------------------------------------------------------------------------

body <- dashboardBody(

  # -- tabItems
  tabItems(

    # -- tabItem
    tabItem(tabName = "home",

            # -- Admin
            fluidRow(
              column(width = 8,

                     h1("Home"),
                     p("This application demonstrates how to implement kitems module.")))),

    # -- tabItem
    tabItem(tabName = "data",

            # -- Admin
            fluidRow(
              column(width = 12,

                     kitems::admin_ui("data"))))


  ) # end tabItems
) # end dashboardBody


# ------------------------------------------------------------------------------
# Put them together into a dashboard
# ------------------------------------------------------------------------------

dashboardPage(
  dashboardHeader(title = "kitems Demo App"), sidebar, body)
