# sql_csv_export

A gem for fast, efficient, streaming CSV exports of large datasets from your rails app. 

## Usage

Include in application helper to allow for streaming csv downloads. 

```ruby
module ApplicationHelper
  include SqlCsvExport
end
```

Extend from the export class to create a specific sort of CSV export. 

```ruby
class MembersExport < SqlCsvExport::Export
  def klass
    Member
  end

  def sql
    Member.all.to_sql
  end

  def name
    'all_members'
  end
end
```

Vary the columns returned by the sql method to change the csv export output. 

```ruby
Member.all.select(:first_name, :email).to_sql
```


Export a csv from a controller. 

```ruby
class MembersController < ApplicationController
  def export
    respond_to do |format|
      format.csv do
        streaming_csv_export MembersExport.new
      end
    end
  end
end
```

## Copyright

Copyright (c) 2013 ControlShift Ltd. See LICENSE.txt for
further details.

