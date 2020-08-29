module Commands
  module Execute
    def execute(command)
      command.validate!
      handler_for(command).call(command)
    end

    private

    def handler_for(command)
      {
        Commands::Currencies::CreateCurrency => CommandHandlers::Currencies::CreateCurrency.new,
        Commands::Currencies::UpdateCurrency => CommandHandlers::Currencies::UpdateCurrency.new,
        Commands::Currencies::DeleteCurrency => CommandHandlers::Currencies::DeleteCurrency.new
      }.fetch(command.class)
    end
  end
end
