module Commands
  module Execute
    def execute(command)
      command.validate!
      handler_for(command).call(command)
    end

    private

    def handler_for(command)
      {
        Commands::Currencies::CreateCurrency => CommandHandlers::Currencies::CreateCurrency,
        Commands::Currencies::UpdateCurrency => CommandHandlers::Currencies::UpdateCurrency,
        Commands::Currencies::DeleteCurrency => CommandHandlers::Currencies::DeleteCurrency,
        Commands::Currencies::ExternalUpdateCurrency => CommandHandlers::Currencies::UpdateCurrency
      }.fetch(command.class)
    end
  end
end
