require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/all_casa_admins/patch_notes", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # PatchNote. As you add validations to PatchNote, be sure to
  # adjust the attributes here as well.
  let(:all_casa_admin) { build(:all_casa_admin) }
  let(:patch_note_group) { create(:patch_note_group) }
  let(:patch_note_type) { create(:patch_note_type) }

  let(:valid_attributes) do
    {
      note: "not an empty note",
      patch_note_group_id: patch_note_group.id,
      patch_note_type_id: patch_note_type.id
    }
  end

  let(:invalid_attributes) do
    {
      note: "",
      patch_note_group_id: patch_note_group.id,
      patch_note_type_id: patch_note_type.id
    }
  end

  before { sign_in all_casa_admin }

  describe "GET /index" do
    it "renders a successful response" do
      PatchNote.create! valid_attributes
      get all_casa_admins_patch_notes_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PatchNote" do
        expect {
          post all_casa_admins_patch_notes_path, params: {patch_note: valid_attributes}
        }.to change(PatchNote, :count).by(1)
      end

      it "redirects to the created patch_note" do
        post all_casa_admins_patch_notes_path, params: {patch_note: valid_attributes}
        expect(response).to redirect_to(patch_note_url(PatchNote.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PatchNote" do
        expect {
          post all_casa_admins_patch_notes_path, params: {patch_note: invalid_attributes}
        }.to change(PatchNote, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post all_casa_admins_patch_notes_path, params: {patch_note: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested patch_note" do
        patch_note = PatchNote.create! valid_attributes
        patch all_casa_admins_patch_notes_path(patch_note), params: {patch_note: new_attributes}
        patch_note.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the patch_note" do
        patch_note = PatchNote.create! valid_attributes
        patch all_casa_admins_patch_notes_path(patch_note), params: {patch_note: new_attributes}
        patch_note.reload
        expect(response).to redirect_to(patch_note_url(patch_note))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch_note = PatchNote.create! valid_attributes
        patch all_casa_admins_patch_notes_path(patch_note), params: {patch_note: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested patch_note" do
      patch_note = PatchNote.create! valid_attributes
      expect {
        delete all_casa_admins_patch_notes_path(patch_note)
      }.to change(PatchNote, :count).by(-1)
    end

    it "redirects to the patch_notes list" do
      patch_note = PatchNote.create! valid_attributes
      delete all_casa_admins_patch_notes_path(patch_note)
      expect(response).to redirect_to(patch_notes_url)
    end
  end
end
