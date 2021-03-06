#' @details This function requires having a character vector with one or more valid Report Suites specified.
#'
#' @description Get custom calendar for the specified report suites. 
#' 
#' @title Get Custom Calendar for a Report Suite(s)
#' 
#' @param reportsuite.ids Report suite id (or list of report suite ids)
#'
#' @importFrom jsonlite toJSON
#' @importFrom plyr rbind.fill
#'
#' @return Data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' cal <- GetCustomCalendar("your_report_suite")
#' 
#' cal2 <- GetCustomCalendar(report_suites$rsid)
#' }

GetCustomCalendar <- function(reportsuite.ids) {
  
  request.body <- c()
  request.body$rsid_list <- reportsuite.ids
  
  response <- ApiRequest(body=toJSON(request.body),func.name="ReportSuite.GetCustomCalendar")
  
  #Don't even know if this is possible, holdover from GetSegments code
  if(length(response$calendar_type[[1]]) == 0) {
      return(print("No Calendars Defined For This Report Suite"))
    }

  return(response)

}