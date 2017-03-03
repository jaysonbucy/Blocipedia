class CollaboratorsController < ApplicationController
  def new
    @collaborator = WikiCollaborator.new
  end

  def create
    @collaborator = WikiCollaborator.new(collaborator_params)

    if @collaborator.save
      flash[:notice] = "Collaborator added to this wiki."
      redirect_to [@collaborator.wiki]
    else
      flash[:notice] = "Collaborator cannot be added to the wiki at this time."
      redirect_to [@collaborator.wiki]
    end
  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end
