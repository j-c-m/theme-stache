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

def main():
    config_path = Path('templates/config.json')
    themes_dir = Path('themes')

    try:
        config = load_config(config_path)
    except Exception as e:
        print(f"Error loading config file {config_path}: {e}")
        return

    theme_files = sorted(glob.glob(str(themes_dir / '*.yml')))

    if not theme_files:
        print("No theme files found in themes/ directory.")
        return

    for theme_file in theme_files:
        theme_path = Path(theme_file)

        theme_data = load_yaml(theme_path)
        if theme_data is None:
            continue

        context = {
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
        }

        for template_key, template_config in config.items():
            template_path = Path('templates') / template_key
            if not template_path.exists():
                print(f"Template file {template_path} not found, skipping for theme {theme_data['name']}...")
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
                print(f"Generated theme file for {theme_data['name']} at: {output_path}")
            except Exception as e:
                print(f"Error writing output file {output_path}: {e}")

if __name__ == "__main__":
    main()
