# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Publications" do
    describe "Admin" do
      describe "authors" do
        login_refinery_user

        describe "authors list" do
          before do
            FactoryGirl.create(:author, :name => "UniqueTitleOne")
            FactoryGirl.create(:author, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.publications_admin_authors_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.publications_admin_authors_path

            click_link "Add New Author"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Publications::Author.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Publications::Author.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:author, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.publications_admin_authors_path

              click_link "Add New Author"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Publications::Author.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:author, :name => "A name") }

          it "should succeed" do
            visit refinery.publications_admin_authors_path

            within ".actions" do
              click_link "Edit this author"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:author, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.publications_admin_authors_path

            click_link "Remove this author forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Publications::Author.count.should == 0
          end
        end

      end
    end
  end
end
