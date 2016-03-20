class CreateJoinTableAppreciationKeyword < ActiveRecord::Migration
  def change
    create_join_table :appreciations, :keywords do |t|
      # t.index [:appreciation_id, :keyword_id]
      # t.index [:keyword_id, :appreciation_id]
    end
  end
end
