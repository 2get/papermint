require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :content => "MyString",
      :user_id => 1,
      :priority => 1
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_content", :name => "task[content]"
      assert_select "input#task_user_id", :name => "task[user_id]"
      assert_select "input#task_priority", :name => "task[priority]"
    end
  end
end
