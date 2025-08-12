#!/usr/bin/env python3
import json
import yaml
import pystache
import os
from pathlib import Path
import glob

def load_config(config_path):
    """Load the config.json file."""
    with open(config_path, 'r') as f:
        return json.load(f)

def load_yaml(yaml_path):
    """Load a YAML color scheme file."""
    try:
        with open(yaml_path, 'r') as f:
            return yaml.safe_load(f)
    except Exception as e:
        print(f"Error loading YAML file {yaml_path}: {e}")
        return None

def slugify(name):
    """Convert theme name to a slug (lowercase, replace spaces with hyphens)."""
    return name.lower().replace(' ', '-')

def map_theme_data(theme_data, source, theme_path):
    """Map theme data from different sources to the standard context for Mustache templates."""
    context = {
        'theme-source': source,
        'theme-source-slug': slugify(source)
    }

    if source == 'gogh':
        # Required fields for Gogh schema
        required_fields = [
            'name', 'author', 'variant',
            'color_01', 'color_02', 'color_03', 'color_04',
            'color_05', 'color_06', 'color_07', 'color_08',
            'color_09', 'color_10', 'color_11', 'color_12',
            'color_13', 'color_14', 'color_15', 'color_16',
            'foreground', 'background', 'cursor'
        ]
        missing_fields = [field for field in required_fields if theme_data.get(field) is None]
        if missing_fields:
            raise ValueError(f"Missing required fields in {theme_path}: {', '.join(missing_fields)}")

        context.update({
            'theme-slug': slugify(theme_data['name']),
            'theme-name': theme_data['name'],
            'theme-variant': theme_data['variant'],
            'theme-author': theme_data['author'],
            'color_01_hex': theme_data['color_01'],
            'color_02_hex': theme_data['color_02'],
            'color_03_hex': theme_data['color_03'],
            'color_04_hex': theme_data['color_04'],
            'color_05_hex': theme_data['color_05'],
            'color_06_hex': theme_data['color_06'],
            'color_07_hex': theme_data['color_07'],
            'color_08_hex': theme_data['color_08'],
            'color_09_hex': theme_data['color_09'],
            'color_10_hex': theme_data['color_10'],
            'color_11_hex': theme_data['color_11'],
            'color_12_hex': theme_data['color_12'],
            'color_13_hex': theme_data['color_13'],
            'color_14_hex': theme_data['color_14'],
            'color_15_hex': theme_data['color_15'],
            'color_16_hex': theme_data['color_16'],
            'foreground_hex': theme_data['foreground'],
            'background_hex': theme_data['background'],
            'cursor_hex': theme_data['cursor']
        })
    elif source == 'base16':
        # Required fields for Base16 schema
        required_fields = ['name', 'author', 'variant', 'palette']
        missing_fields = [field for field in required_fields if theme_data.get(field) is None]
        if missing_fields:
            raise ValueError(f"Missing required fields in {theme_path}: {', '.join(missing_fields)}")

        palette = theme_data['palette']
        required_palette_fields = [
            'base00', 'base01', 'base02', 'base03', 'base04',
            'base05', 'base06', 'base07', 'base08', 'base09',
            'base0A', 'base0B', 'base0C', 'base0D', 'base0E', 'base0F'
        ]
        missing_palette_fields = [field for field in required_palette_fields if palette.get(field) is None]
        if missing_palette_fields:
            raise ValueError(f"Missing required palette fields in {theme_path}: {', '.join(missing_palette_fields)}")

        context.update({
            'theme-slug': slugify(theme_data['name']),
            'theme-name': theme_data['name'],
            'theme-variant': theme_data['variant'],
            'theme-author': theme_data['author'],
            'color_01_hex': palette['base00'],  # Black
            'color_02_hex': palette['base08'],  # Red
            'color_03_hex': palette['base0B'],  # Green
            'color_04_hex': palette['base0A'],  # Yellow
            'color_05_hex': palette['base0D'],  # Blue
            'color_06_hex': palette['base0E'],  # Magenta
            'color_07_hex': palette['base0C'],  # Cyan
            'color_08_hex': palette['base05'],  # White
            'color_09_hex': palette['base03'],  # Bright Black
            'color_10_hex': palette['base08'],  # Bright Red
            'color_11_hex': palette['base0B'],  # Bright Green
            'color_12_hex': palette['base0A'],  # Bright Yellow
            'color_13_hex': palette['base0D'],  # Bright Blue
            'color_14_hex': palette['base0E'],  # Bright Magenta
            'color_15_hex': palette['base0C'],  # Bright Cyan
            'color_16_hex': palette['base07'],  # Bright White
            'foreground_hex': palette['base05'],  # Foreground
            'background_hex': palette['base00'],  # Background
            'cursor_hex': palette['base05']  # Cursor
        })
    else:
        # Placeholder for other theme sources (no strict validation)
        context.update({
            'theme-slug': slugify(theme_data.get('theme_name', 'unknown')),
            'theme-name': theme_data.get('theme_name', 'Unknown Theme'),
            'theme-variant': theme_data.get('type', ''),
            'theme-author': theme_data.get('creator', ''),
            'color_01_hex': theme_data.get('colors', {}).get('black', '#000000'),
            'color_02_hex': theme_data.get('colors', {}).get('red', '#000000'),
            'color_03_hex': theme_data.get('colors', {}).get('green', '#000000'),
            'color_04_hex': theme_data.get('colors', {}).get('yellow', '#000000'),
            'color_05_hex': theme_data.get('colors', {}).get('blue', '#000000'),
            'color_06_hex': theme_data.get('colors', {}).get('magenta', '#000000'),
            'color_07_hex': theme_data.get('colors', {}).get('cyan', '#000000'),
            'color_08_hex': theme_data.get('colors', {}).get('white', '#000000'),
            'color_09_hex': theme_data.get('colors', {}).get('bright_black', '#000000'),
            'color_10_hex': theme_data.get('colors', {}).get('bright_red', '#000000'),
            'color_11_hex': theme_data.get('colors', {}).get('bright_green', '#000000'),
            'color_12_hex': theme_data.get('colors', {}).get('bright_yellow', '#000000'),
            'color_13_hex': theme_data.get('colors', {}).get('bright_blue', '#000000'),
            'color_14_hex': theme_data.get('colors', {}).get('bright_magenta', '#000000'),
            'color_15_hex': theme_data.get('colors', {}).get('bright_cyan', '#000000'),
            'color_16_hex': theme_data.get('colors', {}).get('bright_white', '#000000'),
            'foreground_hex': theme_data.get('foreground', '#FFFFFF'),
            'background_hex': theme_data.get('background', '#000000'),
            'cursor_hex': theme_data.get('cursor', '#FFFFFF')
        })

    return context

def main():
    config_path = Path('templates/config.json')

    try:
        config = load_config(config_path)
    except Exception as e:
        print(f"Error loading config file {config_path}: {e}")
        return

    themes_base_dir = Path('themes')
    theme_sources = [d for d in themes_base_dir.iterdir() if d.is_dir()]

    if not theme_sources:
        print("No theme source directories found in themes/ directory.")
        return

    for source_dir in theme_sources:
        source_name = source_dir.name  # e.g., 'gogh', 'base16'
        theme_files = sorted(glob.glob(str(source_dir / '*.yaml')) + glob.glob(str(source_dir / '*.yml')))

        if not theme_files:
            print(f"No theme files found in {source_dir} directory.")
            continue

        for theme_file in theme_files:
            theme_path = Path(theme_file)
            theme_data = load_yaml(theme_path)
            if theme_data is None:
                continue

            # Map theme data to standard context based on source
            try:
                context = map_theme_data(theme_data, source_name, theme_path)
            except ValueError as e:
                print(f"Validation error for {theme_path}: {e}")
                continue

            for template_key, template_config in config.items():
                template_path = Path('templates') / template_key
                if not template_path.exists():
                    print(f"Template file {template_path} not found, skipping for theme {context['theme-name']}...")
                    continue

                try:
                    with open(template_path, 'r') as f:
                        template = f.read()
                except Exception as e:
                    print(f"Error reading template file {template_path}: {e}")
                    continue

                rendered = pystache.render(template, context)

                output_dir = Path(template_config['directory'])
                output_filename = pystache.render(template_config['filename'], context)
                output_path = output_dir / output_filename

                try:
                    os.makedirs(output_dir, exist_ok=True)
                except Exception as e:
                    print(f"Error creating output directory {output_dir}: {e}")
                    continue

                try:
                    with open(output_path, 'w') as f:
                        f.write(rendered)
                    print(f"Generated theme file for [{template_key}] [{context['theme-source']}] {context['theme-name']} at: {output_path}")
                except Exception as e:
                    print(f"Error writing output file {output_path}: {e}")

if __name__ == "__main__":
    main()
