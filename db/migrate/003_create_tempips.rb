class CreateTempips < ActiveRecord::Migration
  def self.up
    create_table :tempips do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :tempips
  end
end
