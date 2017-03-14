require 'pronto'
require 'haml_lint'

module Pronto
  class Haml < Runner
    def run
      return [] unless @patches

      @patches.select { |patch| patch.additions > 0 }
        .select { |patch| haml_file?(patch.new_file_full_path) }
        .map { |patch| inspect(patch) }
        .flatten.compact
    end

    def inspect(patch)
      lints = runner.run(files: [patch.new_file_full_path.to_s], reporter: reporter).lints
      lints.map do |lint|
        patch.added_lines.select { |line| line.new_lineno == lint.line }
          .map { |line| new_message(lint, line) }
      end
    end

    def new_message(lint, line)
      path = line.patch.delta.new_file[:path]
      Message.new(path, line, lint.severity.name, lint.message, nil, self.class)
    end

    private

    def haml_file?(path)
      File.extname(path) == '.haml'
    end

    def reporter
      @reporter ||= ::HamlLint::Reporter::DefaultReporter.new(
        ::HamlLint::Logger.new(StringIO.new)
      )
    end

    def runner
      @runner ||= ::HamlLint::Runner.new
    end
  end
end
