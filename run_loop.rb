require 'set'

class RunLoop
  KeyValue = Struct.new(:sort_key, :object) do
    def <=>(other)
      sort_key <=> other.sort_key
    end
  end

  Task = Struct.new(:interval, :block, :repeats)

  def initialize
    @tasks = SortedSet.new
  end

  def start
    loop do
      if (next_set_item = tasks.first) && next_set_item.sort_key <= Time.now.to_f
        tasks.delete(next_set_item)

        next_task = next_set_item.object
        next_task.block.call

        schedule_task(next_task) if next_task.repeats
      else
        sleep 0.0001
      end
    end
  end

  def schedule(interval, block, repeats)
    schedule_task(Task.new(interval, block, repeats))
  end

  private
  attr_reader :tasks

  def schedule_task(task)
    tasks << KeyValue.new(task.interval / 1000.to_f + Time.now.to_f, task)
  end
end
