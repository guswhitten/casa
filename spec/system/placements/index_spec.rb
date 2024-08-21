require "rails_helper"

RSpec.describe "placements/destroy", type: :system do
  let(:now) { Date.new(2025, 1, 2) }
  let(:casa_org) { create(:casa_org, :with_placement_types) }
  let(:admin) { create(:casa_admin, casa_org:) }
  let(:casa_case) { create(:casa_case, casa_org:, case_number: "123") }
  let(:placement_current) { create(:placement_type, name: "Reunification", casa_org:) }
  let(:placement_prev) { create(:placement_type, name: "Kinship", casa_org:) }
  let(:placement_first) { create(:placement_type, name: "Adoption", casa_org:) }
  let(:placements) do
    [
      create(:placement, placement_started_at: "2024-08-15 20:40:44 UTC", casa_case:, placement_type: placement_current),
      create(:placement, placement_started_at: "2023-06-02 00:00:00 UTC", casa_case:, placement_type: placement_prev),
      create(:placement, placement_started_at: "2021-12-25 10:10:10 UTC", casa_case:, placement_type: placement_first)
    ]
  end

  before do
    travel_to now
    sign_in admin
    visit casa_case_placements_path(casa_case, placement)
    click_on "Delete"
  end

  it "does not delete on modal close" do
    expect(page).to have_text("Delete Placement?")
    click_on "Close"

    expect(page).to have_text("Reunification")
    expect(page).to have_text("August 15, 2024 - Present")
  end

  it "deletes placement" do
    expect(page).to have_text("Delete Placement?")
    click_on "Confirm"

    expect(page).to have_text("Placement was successfully deleted.")
    expect(page).not_to have_text("Reunification")
    expect(page).not_to have_text("August 15, 2024 - Present")
  end
end
