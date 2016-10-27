object @paginated
attributes :page, :per_page, :total_pages, :total_entries

child :items => :items do
  extends @paginated[:item_template]
end
