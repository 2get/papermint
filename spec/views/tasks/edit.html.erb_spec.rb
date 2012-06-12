require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :content => "MyString",
      :user_id => 1,
      :priority => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_content", :name => "task[content]"
      assert_select "input#task_user_id", :name => "task[user_id]"
      assert_select "input#task_priority", :name => "task[priority]"
    end
  end
end
