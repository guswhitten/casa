class AllCasaAdmins::PatchNotesController < AllCasaAdminsController
  # GET /patch_notes or /patch_notes.json
  def index
    @patch_notes = PatchNote.all
  end

  # POST /patch_notes or /patch_notes.json
  def create
    @patch_note = PatchNote.new(patch_note_params)

    respond_to do |format|
      if @patch_note.save
        format.json { render :show, status: :created, location: @patch_note }
      else
        format.json { render json: @patch_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patch_notes/1 or /patch_notes/1.json
  def update
    respond_to do |format|
      if @patch_note.update(patch_note_params)
        format.json { render :show, status: :ok, location: @patch_note }
      else
        format.json { render json: @patch_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patch_notes/1 or /patch_notes/1.json
  def destroy
    @patch_note.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patch_note
    @patch_note = PatchNote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patch_note_params
    params.require(:patch_note).permit(:note, :patch_note_group_id, :patch_note_type_id)
  end
end
