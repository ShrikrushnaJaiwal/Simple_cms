class SubjectsController < ApplicationController
     layout 'admin'
        def index
          list 
          render 'list'
        end
	def list
	    @subjects=Subject.order("subjects.position ASC")
	end
	
	def show
            @subject=Subject.find(params[:id])
	end
	
	def edit
	    @subject=Subject.find(params[:id])
             @subject_count=Subject.count 
 
	end
	
	def new
        @subject=Subject.new
        @subject_count=Subject.count + 1 
	end

        def create
         @subject=Subject.new(params[:subject])
          if @subject.save
                 flash[:notice]="Subject Created"
	         redirect_to(:action=>'list')
         else
	  	 redirect_to('new')
         end
       end
       
       def update
          @subject=Subject.find(params[:id])
	  if @subject.update_attributes(params[:subject])
	           flash[:notice]="Subject Updated"  
	         redirect_to(:action=>'show',:id=>@subject.id)
         else
	  	 render('edit')
	    end 	 
         end
       
       def delete
           @subject=Subject.find(params[:id])
       
       end
       
       def destroy
        Subject.find(params[:id]).destroy
          flash[:notice]="Subject Deleted"
        redirect_to(:action=>'list')
       
       end 
       
end
