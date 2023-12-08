module ApplicationHelper
    def logged_in?
        session[:subscriber_id]
    end

    def current_user   
        @current_user ||= Subscriber.find_by_id(session[:subscriber_id]) if session[:subscriber_id] 
    end
end
