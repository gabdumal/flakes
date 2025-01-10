{ lib, ... }:
{

  programs = {
    ## Themes
    starship = {
      settings = {
        # "$schema" = "https://starship.rs/config-schema.json";

        add_newline = true;
        command_timeout = 500;
        scan_timeout = 30;

        format = lib.concatStrings [
          "[](fg:peach)"
          "$shell"
          "$sudo"
          "$status"

          "[](fg:flamingo inverted)"
          "[ ](bg:flamingo)"
          "$directory"
          "[ ](fg:flamingo)"

          "([](fg:lavender)"
          "$git_branch"
          "$git_commit"
          "$git_state"
          "$git_metrics"
          "[](fg:lavender))"

          "$fill"

          "$nodejs"
          "$deno"
          "$bun"
          "$dart"
          "$c"
          "$cmake"
          "$java"
          "$python"
          "$rust"
          "$typst"

          "$package"
          "$direnv"
          "$cmd_duration"

          " \n\r"
          " $character"
        ];
        right_format = lib.concatStrings [
        ];

        ## System

        directory = {
          disabled = false;
          fish_style_pwd_dir_length = 1;
          format = "[$read_only]($read_only_style)[$path]($style)";
          home_symbol = "";
          read_only = "󰏯 ";
          read_only_style = "bg:flamingo fg:red";
          repo_root_format = "[$read_only]($read_only_style)[$before_root_path]($style)[$repo_root]($repo_root_style)[$path]($style)";
          style = "bg:flamingo fg:base";
          truncate_to_repo = true;
          truncation_length = 3;
          truncation_symbol = "…/";
          use_logical_path = true;
          use_os_path_sep = true;
        };

        directory.substitutions = {
          "dev" = "";
          "Documents" = "󰈙";
          "Downloads" = "";
          "Music" = "";
          "Pictures" = "";
        };

        character = {
          format = "$symbol ";
          vicmd_symbol = "[❮](bold green)";
          disabled = false;
          success_symbol = "[➜](bold green) ";
          error_symbol = "[✗](bold red) ";
        };

        cmd_duration = {
          format = "( [](fg:sky)[ $duration]($style)[](fg:sky))";
          style = "bold bg:sky fg:base";
          show_milliseconds = false;
          disabled = false;
          show_notifications = false;
        };

        fill = {
          style = "";
          symbol = " ";
          disabled = false;
        };

        package = {
          format = "( [](fg:yellow)[$symbol $version]($style)[](fg:yellow))";
          symbol = "";
          style = "bg:yellow fg:base";
        };

        shell = {
          disabled = false;
          format = "[$indicator]($style)";
          style = "bg:peach fg:base";
          fish_indicator = "";
          powershell_indicator = "_";
          zsh_indicator = "󰰷";
          unknown_indicator = "_";
        };

        status = {
          format = "[$symbol]($style)";
          map_symbol = true;
          not_executable_symbol = "[](bg:red fg:peach)[ $status ](bold bg:red fg:base)[](fg:red)";
          not_found_symbol = "[](bg:maroon fg:peach)[ $status ](bold bg:maroon fg:base)[](fg:maroon)";
          pipestatus = false;
          pipestatus_format = "[$pipestatus] => [$symbol$common_meaning$signal_name$maybe_int]($style)";
          pipestatus_separator = "|";
          recognize_signal_code = true;
          signal_symbol = "[](bg:teal fg:peach)[ $status ](bold bg:teal fg:base)[](fg:teal)";
          style = "";
          success_symbol = "[](fg:peach)";
          symbol = "[](bg:rosewater fg:peach)[ $status ](bold bg:rosewater fg:base)[](fg:rosewater)";
          disabled = false;
        };

        sudo = {
          format = "[ $symbol]($style)";
          symbol = "󱥠";
          style = "bg:peach fg:base";
          allow_windows = false;
          disabled = false;
        };

        ## Languages and tools

        bun = {
          format = "( [](fg:#F9F1E1)[$symbol($version)]($style)[](fg:#F9F1E1))";
          symbol = " ";
          style = "bold bg:#F9F1E1 fg:#F472B6";
        };

        c = {
          format = "( [](fg:#004482)[$symbol($version (-$name))]($style)[](fg:#004482))";
          style = "bold bg:#004482 fg:#649AD2";
          symbol = " ";
          commands = [
            [
              "cc"
              "--version"
            ]
            [
              "gcc"
              "--version"
            ]
            [
              "g++"
              "--version"
            ]
            [
              "clang"
              "--version"
            ]
            [
              "clang++"
              "--version"
            ]
          ];
          detect_extensions = [
            "c"
            "h"
            "C"
            "H"
            "cpp"
            "hpp"
            "c++"
            "h++"
            "cc"
            "hh"
            "cxx"
            "hxx"
            "cppm"
            "ixx"
          ];
        };

        cmake = {
          format = "( [](fg:#014E8D)[[$symbol](bg:#014E8D fg:#DF1F29)($version)]($style)[](fg:#014E8D))";
          symbol = " ";
          style = "bold bg:#014E8D fg:#21AA4D";
        };

        dart = {
          format = "( [](fg:#045392)[$symbol($version)]($style)[](fg:#045392))";
          symbol = " ";
          style = "bold bg:#045392 fg:#2AB1EE";
        };

        deno = {
          format = "( [](fg:#70FFAF)[$symbol($version)]($style)[](fg:#70FFAF))";
          symbol = " ";
          style = "bold bg:#70FFAF fg:#0B0D11";
        };

        direnv = {
          format = "( [$symbol$status]($style))";
          symbol = "";
          style = "fg:teal";
          disabled = false;
        };

        git_branch = {
          format = "[$symbol$branch(:$remote_branch)]($style)";
          symbol = " ";
          style = "bg:lavender fg:base";
          truncation_symbol = "…";
          ignore_branches = [ ];
          disabled = false;
        };

        git_commit = {
          commit_hash_length = 7;
          style = "bold fg:green";
          disabled = false;
        };

        git_metrics = {
          added_style = "bold bg:crust fg:green";
          deleted_style = "bold bg:crust fg:red";
          only_nonzero_diffs = true;
          format = "([ ](bg:lavender)([ +$added]($added_style))([ -$deleted]($deleted_style))[ ](bg:crust))";
          disabled = false;
        };

        git_state = {
          disabled = false;
          style = "fg:yellow";
        };

        java = {
          format = "( [](fg:#5283A3)[$symbol($version)]($style)[](fg:#5283A3))";
          style = "bold bg:#5283A3 fg:#F89917";
          symbol = " ";
        };

        nodejs = {
          format = "( [](fg:#417E38)[$symbol($version)]($style)[](fg:#417E38))";
          style = "bold bg:#417E38 fg:#333333";
        };

        python = {
          format = "( [](fg:#4380B1)[$symbol($version)]($style)[](fg:#4380B1))";
          style = "bold bg:#4380B1 fg:#FEDC54";
          symbol = " ";
        };

        rust = {
          format = "( [](fg:#F46623)[$symbol($version)]($style)[](fg:#F46623))";
          style = "bold bg:#F46623 fg:#A72145";
          symbol = " ";
        };

        typst = {
          format = "( [](fg:#127885)[$symbol($version)]($style)[](fg:#127885))";
          style = "bold bg:#127885 fg:#79C3D0";
          symbol = " ";
        };

        custom = { };
      };
    };
  };

}
