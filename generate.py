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

def map_theme_data(theme_data, source):
    """Map theme data from different sources to the standard context for Mustache templates."""
    context = {
        'theme-source': source,
        'theme-source-slug': slugify(source)
    }

    if source == 'gogh':
        # Gogh schema
        context.update({
            'theme-slug': slugify(theme_data.get('name', 'unknown')),
            'theme-name': theme_data.get('name', 'Unknown Theme'),
            'theme-variant': theme_data.get('variant', ''),
            'theme-author': theme_data.get('author', ''),
            'color_01_hex': theme_data.get('color_01', '#000000'),
            'color_02_hex': theme_data.get('color_02', '#000000'),
            'color_03_hex': theme_data.get('color_03', '#000000'),
            'color_04_hex': theme_data.get('color_04', '#000000'),
            'color_05_hex': theme_data.get('color_05', '#000000'),
            'color_06_hex': theme_data.get('color_06', '#000000'),
            'color_07_hex': theme_data.get('color_07', '#000000'),
            'color_08_hex': theme_data.get('color_08', '#000000'),
            'color_09_hex': theme_data.get('color_09', '#000000'),
            'color_10_hex': theme_data.get('color_10', '#000000'),
            'color_11_hex': theme_data.get('color_11', '#000000'),
            'color_12_hex': theme_data.get('color_12', '#000000'),
            'color_13_hex': theme_data.get('color_13', '#000000'),
            'color_14_hex': theme_data.get('color_14', '#000000'),
            'color_15_hex': theme_data.get('color_15', '#000000'),
            'color_16_hex': theme_data.get('color_16', '#000000'),
            'foreground_hex': theme_data.get('foreground', '#FFFFFF'),
            'background_hex': theme_data.get('background', '#000000'),
            'cursor_hex': theme_data.get('cursor', '#FFFFFF')
        })
    else:
        # Placeholder for other theme sources
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
        source_name = source_dir.name  # e.g., 'gogh'
        theme_files = sorted(glob.glob(str(source_dir / '*.yml')))

        if not theme_files:
            print(f"No theme files found in {source_dir} directory.")
            continue

        for theme_file in theme_files:
            theme_path = Path(theme_file)

            theme_data = load_yaml(theme_path)
            if theme_data is None:
                continue

            # Map theme data to standard context based on source
            context = map_theme_data(theme_data, source_name)

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
                    print(f"Generated theme file for {context['theme-name']} at: {output_path}")
                except Exception as e:
                    print(f"Error writing output file {output_path}: {e}")

if __name__ == "__main__":
    main()
