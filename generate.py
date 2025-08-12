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
    with open(yaml_path, 'r') as f:
        return yaml.safe_load(f)

def slugify(name):
    """Convert theme name to a slug (lowercase, replace spaces with hyphens)."""
    return name.lower().replace(' ', '-')

def main():
    # Define paths
    config_path = 'templates/config.json'
    themes_dir = 'themes'

    # Load configuration
    config = load_config(config_path)

    # Get all .yml files in themes directory and sort by filename
    theme_files = sorted(glob.glob(f"{themes_dir}/*.yml"))

    if not theme_files:
        print("No theme files found in themes/ directory.")
        return

    # Iterate through each theme file in sorted order
    for theme_file in theme_files:
        # Load theme data
        theme_data = load_yaml(theme_file)

        # Prepare Mustache context
        context = {
            'scheme-slug': slugify(theme_data['name']),
            'name': theme_data['name'],
            'variant': theme_data['variant'],
            'author': theme_data['author'],
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

        # Iterate through each entry in config.json
        for template_key, template_config in config.items():
            # Read the Mustache template
            template_path = f'templates/{template_key}'
            if not os.path.exists(template_path):
                print(f"Template file {template_path} not found, skipping for theme {theme_data['name']}...")
                continue

            with open(template_path, 'r') as f:
                template = f.read()

            # Render the template with Mustache
            rendered = pystache.render(template, context)

            # Get output path from config, applying full Mustache rendering to filename
            output_dir = template_config['directory']
            output_filename = pystache.render(template_config['filename'], context)
            output_path = Path(output_dir) / output_filename

            # Ensure output directory exists
            os.makedirs(output_dir, exist_ok=True)

            # Write the rendered output
            with open(output_path, 'w') as f:
                f.write(rendered)

            print(f"Generated theme file for {theme_data['name']} at: {output_path}")

if __name__ == "__main__":
    main()
