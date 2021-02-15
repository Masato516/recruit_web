def attach_file_to_trix_editor(path)
    page.attach_file(path) do
        page.find(:xpath, '//*[@id="trix-toolbar-1"]/div[1]/span[3]/button').click
    end
end

