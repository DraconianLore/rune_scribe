class LearningController < ApplicationController
    require "google_drive"

    # Read sheed details
    def overview
        runes_in_structure = {'Two' => 0, 'Four' => 1, 'Eight' => 2}
        sheetID = runes_in_structure[params[:number_of_runes]]
        
        # Creates a session.
        session = GoogleDrive::Session.from_service_account_key(
            "runescribeapi-creds.json")

        ws = session.spreadsheet_by_key("1T8dWQ-7QURPSxiORzw2-cOOa75WYgQz5c6HYYCB7J2E").worksheets[sheetID]

        # table = ws.rows
        table = []
        (1..ws.num_rows).each do |row|
            currentRow = []
            (1..ws.num_cols).each do |col|
                current = ws[row, col]
                if current[0,2] === 'xx' # Check for 'xx' at the start of the item meaning undiscovered and rename to Undiscovered to avoid cheating
                    currentRow.push('Unknown')
                elsif current === ''
                    currentRow.push('BLANK')
                else
                    structure = Structure.find_by_name(current)
                    currentRow.push(structure && [structure.name, structure.dominant] || current)
                end
            end
            table.push(currentRow)
        end

        render :json => {
            headers: table[0],
            tableData: table
        }

    end
    
    def checkStructure
        runes_in_structure = {2 => 0, 4 => 1, 8 => 2}
        sheetID = runes_in_structure[params[:number_of_runes]]
        position_to_check = params[:position]
        
        # Create a session.
        session = GoogleDrive::Session.from_service_account_key(
            "./../../runescribeapi-creds.json")
            
            ws = session.spreadsheet_by_key("1T8dWQ-7QURPSxiORzw2-cOOa75WYgQz5c6HYYCB7J2E").worksheets[sheetID]
            
            # check the result after removing the xx
            position_result = ws[position_to_check].slice![0,1]
        
            # write the results to the spreadsheet(remove xx)
            # ws[position_to_check] = position_result
        # ws.save
        
    end
    
    private
    
end

# Gets content of cell.
# p ws[7, 1]

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
# ws[33, 3] = "foo"
# ws[33, 4] = "bar"
# ws.save

# Dumps all cells.
# (1..ws.num_rows).each do |row|
#   (1..ws.num_cols).each do |col|
#     current = ws[row, col]
#     if current[0,2] === 'xx' # Check for 'xx' at the start of the item meaning undiscovered
#         puts [current, row, col]
#     end
#   end
# end

# Yet another way to do so.
# p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

# Reload in case of other changes
# ws.reload

