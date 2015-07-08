require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_returns_all_tasks
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    TaskManager.create({ :title       => "a title 2",
                         :description => "a description 2"})
    TaskManager.create({ :title       => "a title 3",
                         :description => "a description 3"})
    all_tasks = TaskManager.all
    assert_equal 3, all_tasks.count
  end

  def test_it_finds_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    TaskManager.create({ :title       => "a title 2",
                         :description => "a description 2"})
    TaskManager.create({ :title       => "a title 3",
                         :description => "a description 3"})
    task = TaskManager.find(2)
    assert_equal "a title 2", task.title
    assert_equal "a description 2", task.description
    assert_equal 2, task.id
  end

  def test_it_updates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    TaskManager.update(1, { :title       => "new title",
                            :description => "new description"})
    task = TaskManager.find(1)
    assert_equal "new title", task.title
    assert_equal "new description", task.description
    assert_equal 1, task.id
  end

  def test_it_destroys_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    assert_equal 1, TaskManager.all.count
    TaskManager.delete(1)
    assert_equal 0, TaskManager.all.count
  end
end
